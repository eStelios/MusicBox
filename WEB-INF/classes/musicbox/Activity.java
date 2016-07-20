package musicbox;

import java.sql.*;
import java.util.*;

public class Activity {

	 private String errorMessages = "";

	 private Connection con = null;

	 private PreparedStatement stmt = null, stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null, stmt5 = null;

	 //private Statement stmt5 = null;

	 private ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null;

	 private final String selectAllCommentsQuery = "select comment, event_id, user_id, date from activity where event_id=? and comment<>?";

	 private final String insertCommentQuery = "insert into activity (user_id, event_id, attend, comment) values (?,?,?,?)";

	 private final String insertAttendQuery = "insert into activity (attend, user_id, event_id, comment) values(?,?,?,?)";

	 private final String selectUsernameQuerry = "SELECT u.username FROM user u, activity a WHERE u.user_id = a.user_id and u.user_id=?";

	 private final String selectUserIdQuerry = "SELECT user_id FROM user WHERE username=?";

	 private final String countAttendQuery = "SELECT Count(DISTINCT user_id, event_id) AS rowcount FROM activity WHERE event_id = ? and attend = ?";

	 public String getErrorMessages() {
		    return errorMessages;
	 }

	 /**
	   * Default Constructor.
	   *
	   */
	  public Activity() {

	  }

	  public ResultSet getUsername(int user_id){
		  try {
		      if (con == null) {
		        errorMessages = "You must establish a connection first!";
		        return null;
		      }
		      stmt2 = con.prepareStatement(selectUsernameQuerry);
		      stmt2.setInt(1, user_id);
		      ResultSet rs2 = stmt2.executeQuery();
		      return rs2;
		    } catch (Exception e5) {
		      errorMessages = "Error while getting all students from database!<br>"
		          + e5.getMessage();
		      return null;
		    }

	  }

	  public ResultSet getUserId(String username){
		  try {
		      if (con == null) {
		        errorMessages = "You must establish a connection first!";
		        return null;
		      }
		      stmt3 = con.prepareStatement(selectUserIdQuerry);
		      stmt3.setString(1, username);
		      rs1 = stmt3.executeQuery();
		      return rs1;
		    } catch (Exception e5) {
		      errorMessages = "Error while getting all students from database!<br>"
		          + e5.getMessage();
		      return null;
		    }

	  }

	  public ResultSet getAllComments(int event_id) {
		    try {
		      if (con == null) {
		        errorMessages = "You must establish a connection first!";
		        return null;
		      }
		      stmt = con.prepareStatement(selectAllCommentsQuery);
		      stmt.setInt(1, event_id);
		      stmt.setString(2, "its not a comment");
		      rs = stmt.executeQuery();
		      return rs;
		    } catch (Exception e5) {
		      errorMessages = "Error while getting all students from database!<br>"
		          + e5.getMessage();
		      return null;
		    }
	  }


	 public void newComment(int event_id, int user_id, String comment) throws SQLException {
		 if (con == null) {
		      errorMessages = "You must establish a connection first!";
		      throw new SQLException(errorMessages);
		    }
		 try {
		      stmt1 = con.prepareStatement(insertCommentQuery);
		      // replacing the first ? with am, the second ? with
		      // name and the third ? with surname.
		      stmt1.setInt(1, user_id);
		      stmt1.setInt(2, event_id);
		      stmt1.setInt(3, 0);
		      stmt1.setString(4, comment);
		      // execute query
		      stmt1.executeUpdate();
		      stmt1.close();

		    } catch (Exception e4) {
		      errorMessages = "Error while inserting comment to the database: <br>"
		          + e4.getMessage();
		      throw new SQLException(errorMessages);
		    }

	 }

	 public void goesTo(int user_id, int event_id) throws SQLException {
		 if (con == null) {
		      errorMessages = "You must establish a connection first!";
		      throw new SQLException(errorMessages);
		    }
		 try {
		      stmt4 = con.prepareStatement(insertAttendQuery);
		      // replacing the first ? with am, the second ? with
		      // name and the third ? with surname.
		      stmt4.setInt(1, 1);
		      stmt4.setInt(2, user_id);
		      stmt4.setInt(3, event_id);
		      stmt4.setString(4, "its not a comment");
		      // execute query
		      stmt4.executeUpdate();
		      stmt4.close();

		    } catch (Exception e4) {
		      errorMessages = "Error while inserting goesTo to the database: <br>"
		          + e4.getMessage();
		      throw new SQLException(errorMessages);
		    }

	 }

	 public int getNumberOfAttends(int event_id) throws SQLException {
		 if (con == null) {
		      errorMessages = "You must establish a connection first!";
		      throw new SQLException(errorMessages);
		 	}
		 try {
			 stmt5 = con.prepareStatement(countAttendQuery);
			 stmt5.setInt(2, 1);
			 stmt5.setInt(1, event_id);
			 rs3 = stmt5.executeQuery();
			 rs3.next();
			 int count = rs3.getInt("rowcount") ;
			 return count;
		 }catch (Exception e4) {
		      errorMessages = "Error while inserting comment to the database: <br>"
			          + e4.getMessage();
			  throw new SQLException(errorMessages);
		 }

	 }

	 public void open() throws SQLException {
		    try {
		      // for JDBC driver to connect to mysql, the .newInstance() method
		      // can be ommited
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		    } catch (Exception e1) {
		      errorMessages = "MySQL Driver error: <br>" + e1.getMessage();
		      throw new SQLException(errorMessages);
		    }

		    try {
		    	// establish a connection with the database and creates a Connection
		    	// object (con)
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicbox", "root", "********");
		    } catch (Exception e2) {
		      errorMessages = "Could not establish connection with the Database Server: <br>"
		          + e2.getMessage();
		      con = null;
		      throw new SQLException(errorMessages);
		    }

		  }

		  /**
		   * Ends the connection with the database Server. Closes all Statements and
		   * ResultSets. Finally, closes the connection with the Database Server.
		   *
		   * @throws SQLException
		   *             (with the appropriate message) if any error occured.
		   */
	 public void close() throws SQLException {
		    try {

		      if (stmt != null)
		        stmt.close();

		      if (stmt1 != null)
		        stmt1.close();

		      if (rs != null)
		        rs.close();

		      if (con != null)
		        con.close();

		    } catch (Exception e3) {
		      errorMessages = "Could not close connection with the Database Server: <br>"
		          + e3.getMessage();
		      throw new SQLException(errorMessages);
		    }
	}

}
