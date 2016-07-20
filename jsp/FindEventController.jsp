<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="musicbox.Event, musicbox.EventDAO, java.sql.Date, java.util.*, java.text.*;" %>


<%
String kmusic = request.getParameter("music");
String kplace = request.getParameter("place");
String kdate = request.getParameter("date");

kplace = new String(kplace.getBytes("ISO-8859-1"), "ISO-8859-7");

String temp = request.getParameter("budget");
int kbudget;
try{
	kbudget = Integer.parseInt(temp);
}catch (NumberFormatException nfe) {
	kbudget = 101;
}

try {
	
		if((kmusic.equals("0")) || (kplace.equals("0")) || !(kdate.length()>0) || (kbudget==101)) {
%>
			<jsp:forward page = "Errorprinter.jsp"/>
<%
		}else {

			EventDAO edao= new EventDAO();
			edao.open();

			List<Event> eventlist = edao.findEvent(kmusic, kplace, kdate, kbudget);

			request.setAttribute("searchresults", eventlist); //adding list to request via attribute

			edao.close();
%>
			<jsp:forward page = "ShowEvents2.jsp"/>
<%
		}
    } catch (Exception ex) {
%>
<%="mpla"%>
<%
		request.setAttribute("errormsg", ex.getMessage()); //adding error message to request via attribute

    }
%>