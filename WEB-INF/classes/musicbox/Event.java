package musicbox;

import java.util.*;

public class Event {

	public Event() {}

	private String music;
	private String place;
	private String date;
	private int budget;
	private String description;
	private String time;
	private String stage;
	private String link;
	private int event_id;

	public void setMusic(String music) {
		this.music = music;
	}

	public String getMusic() {
		return music;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPlace() {
		return place;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public int getBudget() {
		return budget;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTime() {
		return time;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public String getStage() {
		return stage;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getLink() {
		return link;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public int getEvent_id() {
		return event_id;
	}



}//end of class
