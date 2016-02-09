package com.myspring.gachon.admin.course.vo;

import org.apache.ibatis.type.Alias;

@Alias(value = "AdminCourseAllVO")

public class AdminCourseAllVO {
	String courseNum;
	String courseName;
	String year;
	String semester;
	String college;
	String completeDivision;
	String completeDivision_nm;
	String schoolYear;
	String schoolYear_nm;
	String grade;
	String grade_nm;
	String professor;
	String phone;
	String email;
	String capacity;
	String cyberYN;
	String lecRoom;
	String lecTime;
	String lecTime_nm;
	String area;
	String area_nm;
	String prerequisiteCourse;
	String engineeringAuthentication;
	String engineeringAuthentication_nm;
	String summary;
	String goal;
	String progressWay;
	String valuationBasis;
	String major;
	String crtUser;
	String crtDt;
	String updtUser;
	String updtDt;
	String appYn;
	String memberId;
	
	// changeCourse page
	String giveMemberId;
	String giveWriterMemberId;
	String giveSubject;
	
	String takeMemberId;
	String takeWriterMemberId;
	String takeSubject;
	
	String notMemberId;
	String exitYn;
	String boardNum;
	
	public String getUpdtDt() {
		return updtDt;
	}
	public void setUpdtDt(String updtDt) {
		this.updtDt = updtDt;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCourseNum() {
		return courseNum;
	}
	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	public String getCompleteDivision() {
		return completeDivision;
	}
	public void setCompleteDivision(String completeDivision) {
		this.completeDivision = completeDivision;
	}
	public String getCompleteDivision_nm() {
		return completeDivision_nm;
	}
	public void setCompleteDivision_nm(String completeDivision_nm) {
		this.completeDivision_nm = completeDivision_nm;
	}
	public String getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(String schoolYear) {
		this.schoolYear = schoolYear;
	}
	public String getSchoolYear_nm() {
		return schoolYear_nm;
	}
	public void setSchoolYear_nm(String schoolYear_nm) {
		this.schoolYear_nm = schoolYear_nm;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGrade_nm() {
		return grade_nm;
	}
	public void setGrade_nm(String grade_nm) {
		this.grade_nm = grade_nm;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getCyberYN() {
		return cyberYN;
	}
	public void setCyberYN(String cyberYN) {
		this.cyberYN = cyberYN;
	}
	public String getLecRoom() {
		return lecRoom;
	}
	public void setLecRoom(String lecRoom) {
		this.lecRoom = lecRoom;
	}
	public String getLecTime() {
		return lecTime;
	}
	public void setLecTime(String lecTime) {
		this.lecTime = lecTime;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getArea_nm() {
		return area_nm;
	}
	public void setArea_nm(String area_nm) {
		this.area_nm = area_nm;
	}
	public String getPrerequisiteCourse() {
		return prerequisiteCourse;
	}
	public void setPrerequisiteCourse(String prerequisiteCourse) {
		this.prerequisiteCourse = prerequisiteCourse;
	}
	public String getEngineeringAuthentication() {
		return engineeringAuthentication;
	}
	public void setEngineeringAuthentication(String engineeringAuthentication) {
		this.engineeringAuthentication = engineeringAuthentication;
	}
	public String getEngineeringAuthentication_nm() {
		return engineeringAuthentication_nm;
	}
	public void setEngineeringAuthentication_nm(String engineeringAuthentication_nm) {
		this.engineeringAuthentication_nm = engineeringAuthentication_nm;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getProgressWay() {
		return progressWay;
	}
	public void setProgressWay(String progressWay) {
		this.progressWay = progressWay;
	}
	public String getValuationBasis() {
		return valuationBasis;
	}
	public void setValuationBasis(String valuationBasis) {
		this.valuationBasis = valuationBasis;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getCrtUser() {
		return crtUser;
	}
	public void setCrtUser(String crtUser) {
		this.crtUser = crtUser;
	}
	public String getCrtDt() {
		return crtDt;
	}
	public void setCrtDt(String crtDt) {
		this.crtDt = crtDt;
	}
	public String getUpdtUser() {
		return updtUser;
	}
	public void setUpdtUser(String updtUser) {
		this.updtUser = updtUser;
	}
	public String getUpdtdDt() {
		return updtDt;
	}
	public void setUpdtdDt(String updtdDt) {
		this.updtDt = updtdDt;
	}
	public String getAppYn() {
		return appYn;
	}
	public void setAppYn(String appYn) {
		this.appYn = appYn;
	}
	public String getLecTime_nm() {
		return lecTime_nm;
	}
	public void setLecTime_nm(String lecTime_nm) {
		this.lecTime_nm = lecTime_nm;
	}
	
	public String getExitYn() {
		return exitYn;
	}
	public void setExitYn(String exitYn) {
		this.exitYn = exitYn;
	}
	public String getGiveMemberId() {
		return giveMemberId;
	}
	public void setGiveMemberId(String giveMemberId) {
		this.giveMemberId = giveMemberId;
	}
	public String getGiveWriterMemberId() {
		return giveWriterMemberId;
	}
	public void setGiveWriterMemberId(String giveWriterMemberId) {
		this.giveWriterMemberId = giveWriterMemberId;
	}
	public String getGiveSubject() {
		return giveSubject;
	}
	public void setGiveSubject(String giveSubject) {
		this.giveSubject = giveSubject;
	}
	public String getTakeMemberId() {
		return takeMemberId;
	}
	public void setTakeMemberId(String takeMemberId) {
		this.takeMemberId = takeMemberId;
	}
	public String getTakeWriterMemberId() {
		return takeWriterMemberId;
	}
	public void setTakeWriterMemberId(String takeWriterMemberId) {
		this.takeWriterMemberId = takeWriterMemberId;
	}
	public String getTakeSubject() {
		return takeSubject;
	}
	public String getNotMemberId() {
		return notMemberId;
	}
	public void setNotMemberId(String notMemberId) {
		this.notMemberId = notMemberId;
	}
	public void setTakeSubject(String takeSubject) {
		this.takeSubject = takeSubject;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	
	
}
