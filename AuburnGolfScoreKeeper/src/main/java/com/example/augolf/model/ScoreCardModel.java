package com.example.augolf.model;

import com.mysql.cj.jdbc.Blob;

import java.util.ArrayList;

public class ScoreCardModel {
    private int scoreCardId;
    private int userId;
    private int courseId;
    private ArrayList<Integer> score;
    private int locked;
    private Blob picture;

    public ScoreCardModel(int scoreCardId, int userId, int courseId, ArrayList<Integer> score, int locked, Blob picture) {
        this.scoreCardId = scoreCardId;
        this.userId = userId;
        this.courseId = courseId;
        this.score = score;
        this.locked = locked;
        this.picture = picture;
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

    public int getLocked() {
        return locked;
    }

    public void setLocked(int locked) {
        this.locked = locked;
    }

    public Blob getPicture() {
        return picture;
    }

    public void setPicture(Blob picture) {
        this.picture = picture;
    }
}
