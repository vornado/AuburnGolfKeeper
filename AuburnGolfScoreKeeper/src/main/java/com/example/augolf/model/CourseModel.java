package com.example.augolf.model;

public class CourseModel {
    private int courseId;
    private String clubName;
    private String courseName;
    private String courseCity;
    private String courseState;
    private String coursePar;
    private int locked;

    public CourseModel(int courseId, String clubName, String courseName, String courseCity, String courseState, String coursePar, int locked) {
        this.courseId = courseId;
        this.clubName = clubName;
        this.courseName = courseName;
        this.courseCity = courseCity;
        this.courseState = courseState;
        this.coursePar = coursePar;
        this.locked = locked;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseCity() {
        return courseCity;
    }

    public void setCourseCity(String courseCity) {
        this.courseCity = courseCity;
    }

    public String getCourseState() {
        return courseState;
    }

    public void setCourseState(String courseState) {
        this.courseState = courseState;
    }

    public String getCoursePar() {
        return coursePar;
    }

    public void setCoursePar(String coursePar) {
        this.coursePar = coursePar;
    }

    public int getLocked(){
        return locked;
    }

    public void setLocked(int locked){
        this.locked = locked;
    }
}
