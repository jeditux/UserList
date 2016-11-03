package ru.javarush.userlist.entity;

import javax.persistence.*;
//import java.sql.Timestamp;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Анатолий Гостев on 18.10.2016.
 */
@Entity
@Table(name = "User", schema = "", catalog = "test")
public class UserEntity implements Serializable {
    private int id;
    private String name;
    private int age;
    private boolean isAdmin;
    private Date createdDate;

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 25)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "age", nullable = false, insertable = true, updatable = true)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "isAdmin", nullable = false, insertable = true, updatable = true)
    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "createdDate", nullable = false, insertable = true, updatable = true)
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (age != that.age) return false;
        if (id != that.id) return false;
        if (isAdmin != that.isAdmin) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + age;
        result = 31 * result + (isAdmin ? 1 : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
