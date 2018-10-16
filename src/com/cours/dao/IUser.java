package com.cours.dao;

import com.cours.entities.User;

public interface IUser {
    public User connection(String email, String password);
    public int add(User user);
}
