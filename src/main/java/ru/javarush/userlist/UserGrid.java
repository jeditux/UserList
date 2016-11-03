package ru.javarush.userlist;

import ru.javarush.userlist.entity.UserEntity;

import java.util.List;

/**
 * Created by Анатолий Гостев on 28.10.2016.
 */
public class UserGrid {
    private int totalPages;
    private int currentPage;
    private long totalRecords;
    private List<UserEntity> userData;

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public long getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(long totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<UserEntity> getUserData() {
        return userData;
    }

    public void setUserData(List<UserEntity> userData) {
        this.userData = userData;
    }
}
