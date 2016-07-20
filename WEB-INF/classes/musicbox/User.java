package musicbox;

import java.sql.*;
import java.util.*;

public class User {
	  private String errorMessages = "";

	  private Connection con = null;

	  private PreparedStatement stmt = null, stmt1 = null, stmt2 = null;

	  private ResultSet rs1 = null, rs2 = null, rs3 = null;

	  /*
	   * Define userQuery query.
	   */
	  private final String insertUserQuery = "insert into user (username, password) values (?,?);";

	  private final String selectUserQuery = "select * from user where username=? and password=?;";

	  private final String selectUsernameQuery = "select username from user where username=?";

	  /*
	   * Define staffQuery query.
	   */
	  private final String selectAllUsersQuery = "select * from user;";

	  /**
	   * A method to get errors.
	   *
	   * @return String, representing the error message.
	   */
	  public String getErrorMessages() {
	    return errorMessages;
	  }

	  /**
	   * Default Constructor.
	   *
	   */
	  public User() {

	  }

	  /**
	   * Provides a connection with the Database Server. Initializes JDBC driver
	   * for MySQL. Establishes a connection with the Database Server.
	   *
	   * @throws SQLException
	   *             (with the appropriate message) if any driver or connection
	   *             error occured.
	   */
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
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicbox", "root", "*******");
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

	      if (rs1 != null)
	        rs1.close();

	      if (rs2 != null)
	        rs2.close();

	      if (con != null)
	        con.close();

	    } catch (Exception e3) {
	      errorMessages = "Could not close connection with the Database Server: <br>"
	          + e3.getMessage();
	      throw new SQLException(errorMessages);
	    }
	  }

	  boolean notregistered;

	  public void registerUser(String username, String password) throws SQLException {

	    if (con == null) {
	      errorMessages = "You must establish a connection first!";
	      throw new SQLException(errorMessages);
	    }
	    notregistered = isUserRegistered(username, password);
	    if(notregistered) {

	    try {
	      stmt = con.prepareStatement(insertUserQuery);
	      // replacing the first ? with username and the second ? with password
	      stmt.setString(1, username);
	      stmt.setString(2, password);
	      // execute query
	      stmt.executeUpdate();
	      stmt.close();

	    } catch (Exception e4) {
	      errorMessages = "Error while inserting user to the database: <br>"
	          + e4.getMessage();
	      throw new SQLException(errorMessages);
	    }
	    }
	  }

	  /**
	   * Checks if the username and password are valide.
	   *
	   * @return boolean, true if user is valide, false otherwise.
	   */
	  public boolean isUserRegistered(String username, String password) {

	    if (con == null) {
	      errorMessages = "You must establish a connection first!";
	      return true;
	    }

	    try {
	      stmt1 = con.prepareStatement(selectUserQuery);
	      // replacing the first ? with userName and the second ? with
	      // userPassword
	      stmt1.setString(1, username);
	      stmt1.setString(2, password);

	      // execute query
	      rs1 = stmt1.executeQuery();

	      if (rs1.next()) {
	        stmt1.close();
	        rs1.close();
	        errorMessages = "The user with nickname " + username
	            + " and password " + password +" is already registered!";
	        return false;
	      } else {
	        stmt1.close();
	        rs1.close();
	        return true;
	      }

	    } catch (Exception e4) {
	      errorMessages = "Error while executing selection query: <br>"
	          + e4.getMessage();
	      //throw new SQLException(errorMessages);
	      return true;
	    }
	  }

	  public boolean doesUsernameExist(String username) {

		    if (con == null) {
		      errorMessages = "You must establish a connection first!";
		      return true;
		    }

		    try {
		      stmt2 = con.prepareStatement(selectUsernameQuery);
		      stmt2.setString(1, username);
		      // execute query
		      rs2 = stmt2.executeQuery();

		      if (rs2.next()) {
		        stmt2.close();
		        rs2.close();
		        return true;
		      } else {
		        stmt2.close();
		        rs2.close();
		        return false;
		      }

		    } catch (Exception e4) {
		      errorMessages = "Error while executing selection query: <br>"
		          + e4.getMessage();
		      //throw new SQLException(errorMessages);
		      return true;
		    }
		  }

	  /**
	   * Executes staffQuery and returns the results in a ResultSet, or null if
	   * any error occured.
	   *
	   * @return ResultSet
	   */

	}// end of class

