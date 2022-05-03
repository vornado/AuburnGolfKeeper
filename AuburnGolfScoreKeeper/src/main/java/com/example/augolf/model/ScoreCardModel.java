package com.example.augolf.model;

import com.mysql.cj.jdbc.Blob;

import java.util.ArrayList;

public class ScoreCardModel {
    private int scoreCardId;
    private int userId;
    private int courseId;
    private ArrayList<Integer> score;
    private Blob picture;
    private String courseName;
    private String clubName;
    private String courseState;
    private String courseCity;
    private String DatePlayed;

    public String getDatePlayed() {
        return DatePlayed;
    }

    public void setDatePlayed(String datePlayed) {
        DatePlayed = datePlayed;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getCourseState() {
        return courseState;
    }

    public void setCourseState(String courseState) {
        this.courseState = courseState;
    }

    public String getCourseCity() {
        return courseCity;
    }

    public void setCourseCity(String courseCity) {
        this.courseCity = courseCity;
    }

    public ScoreCardModel(int scoreCardId, int userId, int courseId, ArrayList<Integer> score, Blob picture) {
        this.scoreCardId = scoreCardId;
        this.userId = userId;
        this.courseId = courseId;
        this.score = score;
        this.picture = picture;
    }

    public ScoreCardModel(int scoreCardId, int userId, int courseId, ArrayList<Integer> score) {
        this.scoreCardId = scoreCardId;
        this.userId = userId;
        this.courseId = courseId;
        this.score = score;
    }

    public int getScoreCardId() {
        return scoreCardId;
    }

    public void setScoreCardId(int scoreCardId) {
        this.scoreCardId = scoreCardId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public ArrayList<Integer> getScore() {
        return score;
    }

    public void setScore(ArrayList<Integer> score) {
        this.score = score;
    }

    public Blob getPicture() {
        return picture;
    }

    public void setPicture(Blob picture) {
        this.picture = picture;
    }
}
