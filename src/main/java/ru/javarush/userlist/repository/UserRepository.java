package ru.javarush.userlist.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ru.javarush.userlist.entity.UserEntity;

import java.util.Date;
import java.util.List;

/**
 * Created by Анатолий Гостев on 26.10.2016.
 */

public interface UserRepository extends PagingAndSortingRepository<UserEntity, Integer> {
    @Query("FROM UserEntity WHERE name LIKE :search")
    public List<UserEntity> searchByName(@Param("search") String search);

    @Query("SELECT u FROM UserEntity u WHERE name LIKE :search")
    public Page<UserEntity> searchByName(@Param("search") String search, Pageable pageable);

}
