package ru.javarush.userlist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.userlist.repository.UserRepository;
import ru.javarush.userlist.entity.UserEntity;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import org.springframework.data.domain.Pageable;
import java.util.Date;
import java.util.List;

/**
 * Created by Анатолий Гостев on 20.10.2016.
 */
//@Repository
@Service("jpaUserService")
@Transactional
public class UserService {
    //@PersistenceContext
    //private EntityManager entityManager;

    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<UserEntity> findAllUsers() {
        return (List<UserEntity>) userRepository.findAll();
    }

    @Transactional(readOnly = true)
    public UserEntity findUserById(Integer id) {
        return userRepository.findOne(id);
    }

    @Transactional(readOnly = true)
    public List<UserEntity> searchByName(String search) {
        return userRepository.searchByName("%" + search + "%");
    }

    @Transactional(readOnly = true)
    public Page<UserEntity> searchByName(String search, Pageable pageable) {
        return userRepository.searchByName("%" + search + "%", pageable);
    }

    public void insertUser(UserEntity user) {
        //userRepository.insertUser(user.getName(), user.getAge(), user.isAdmin(), user.getCreatedDate());
    }

    public UserEntity saveUser(UserEntity userEntity) {
        return userRepository.save(userEntity);
    }

    public void deleteUser(Integer id) {
        userRepository.delete(id);
    }

    @Transactional(readOnly = true)
    public Page<UserEntity> findAllByPage(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    /*public List<UserEntity> searchUsers(String search) {
        userRepository.
        System.out.println("ORMService searchUsers is called");
        String sQuery = "from UserEntity where name like \'%" +search+ "%\' order by id";
        TypedQuery<UserEntity> typedQuery = entityManager.createQuery(sQuery, UserEntity.class);
        return typedQuery.getResultList();
    }

    public UserEntity queryUserById(int id) {
        System.out.println("ORMService queryUserById is called");
        return entityManager.find(UserEntity.class, id);
    }

    public boolean updateUser(int id, String name, int age, boolean isAdmin, Date createdDate) {
        System.out.println("ORMService updateUser is called");
        String sQuery = "update user set name = ?, age = ?, isAdmin = ?, createdDate = ? where id= ?";
        Query nativeQuery = entityManager.createNativeQuery(sQuery);
        nativeQuery.setParameter(1, name);
        nativeQuery.setParameter(2, age);
        nativeQuery.setParameter(3, isAdmin);
        nativeQuery.setParameter(4, createdDate);
        nativeQuery.setParameter(5, id);
        int result = nativeQuery.executeUpdate();
        return result > 0;
    }

    public boolean insertUser(String name, int age, boolean isAdmin, Date createdDate) {
        System.out.println("ORMService insertUser is called");
        String sQuery = "insert into user(name, age, isAdmin, createdDate) values(?, ?, ?, ?)";
        Query nativeQuery = entityManager.createNativeQuery(sQuery);
        nativeQuery.setParameter(1, name);
        nativeQuery.setParameter(2, age);
        nativeQuery.setParameter(3, isAdmin);
        nativeQuery.setParameter(4, createdDate);
        int result = nativeQuery.executeUpdate();
        return result > 0;
    }

    public void insertUser(UserEntity user) {
        entityManager.persist(user);
    }

    public boolean deleteUser(int id) {
        System.out.println("ORMService deleteUser is called");
        String sQuery = "delete from user where id = ?";
        Query nativeQuery = entityManager.createNativeQuery(sQuery);
        nativeQuery.setParameter(1, id);
        int result = nativeQuery.executeUpdate();
        return result > 0;
    }*/
}
