package musicbox;

import java.sql.*;
import java.lang.String;
import java.sql.Date;
import java.util.*;

public class EventDAO {

	private String errorMessages = "";
	private Connection con = null;
	PreparedStatement stmt1 = null, stmt2 = null;
	private ResultSet rs = null;
	private final String selectEventInfoQuery = "SELECT description, music, place, stage FROM event WHERE event_id = ?";


	public List<Event> findEvent (String key_music, String key_place, String key_date, int key_budget) throws SQLException {

		try {

			String sqlquery= "SELECT * FROM event WHERE music LIKE ? AND place LIKE ? AND date=? AND budget<=? ;";

			ResultSet rs;
			stmt1 = con.prepareStatement(sqlquery);

			stmt1.setString(1,"%" +  key_music + "%");
			stmt1.setString(2,"%" + key_place + "%");
			stmt1.setString(3, key_date);
			stmt1.setInt(4, key_budget);

			rs = stmt1.executeQuery();

			List<Event> eventList = new ArrayList<Event>();

			Event event = null;

			while(rs.next()) {

				event = new Event();

				event.setDescription(rs.getString("description"));
				event.setStage(rs.getString("stage"));
				event.setMusic(rs.getString("music"));
				event.setPlace(rs.getString("place"));
				event.setDate(rs.getString("date"));
				event.setTime(rs.getString("time"));
				event.setBudget(rs.getInt("budget"));
				event.setLink(rs.getString("link"));
				event.setEvent_id(rs.getInt("event_id"));

				eventList.add(event);
			}

			return eventList;

		} catch (SQLException e) {
			errorMessages = "An error occured while getting products from database: " + e.getMessage();
			throw new SQLException(errorMessages);
		}

	}

	public ResultSet getEventInfo(int event_id){
		  try {
		      if (con == null) {
		        errorMessages = "You must establish a connection first!";
		        return null;
		      }
		      stmt2 = con.prepareStatement(selectEventInfoQuery);
		      stmt2.setInt(1, event_id);
		      ResultSet rs = stmt2.executeQuery();
		      return rs;
		    } catch (Exception e5) {
		      errorMessages = "Error while getting all students from database!<br>"
		          + e5.getMessage();
		      return null;
		    }

	  }

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
	 */
	public EventDAO() {
	}

	public void open() throws SQLException {
		try {
			// dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			errorMessages = "MySQL Driver error: <br>" + e.getMessage();
			// throw SQLException if driver nor found
			throw new SQLException(errorMessages);
		}

		try {
			// establish a connection with the database and creates a Connection
			// object (con)
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicbox", "root", "*******");
		} catch (Exception e) {
			errorMessages = "Could not establish connection with the Database Server: <br>"
					+ e.getMessage();
			con = null;
			// throw SQLException if a database access error occurs
			throw new SQLException(errorMessages);
		}

	} // End of open

	public void close() throws SQLException {
		try {
			// if connection is open
			if (con != null)
				con.close(); // close the connection to the database to end database session

			if (stmt1 != null)
				stmt1.close();

		} catch (Exception e3) {
			errorMessages = "Could not close connection with the Database Server: <br>"
					+ e3.getMessage();
			throw new SQLException(errorMessages);
		}

	}// end of close

}// end of class
