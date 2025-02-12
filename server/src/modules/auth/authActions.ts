import argon2 from "argon2";
import type { RequestHandler } from "express";
import authRepository from "./authRepository";

const login: RequestHandler = async (req, res, next) => {
  try {
    const user = await authRepository.findByEmail(req.body.email);
    if (!user) {
      res.status(400).json({ message: "Email incorrect." });
    }

    const verified = await argon2.verify(
      user.hashed_password,
      req.body.password,
    );

    if (verified) {
      const { hashed_password, ...userWithoutPassword } = user;
      res.json(userWithoutPassword);
    } else {
      res.status(422);
    }
  } catch (error) {
    next(error);
  }
};

const hashingOptions = {
  type: argon2.argon2id,
  memoryCost: 19 * 2 ** 10,
  timeCost: 2,
  parallelism: 1,
};

const hashPassword: RequestHandler = async (req, res, next) => {
  try {
    const { password } = req.body;
    if (!password) {
      res.status(400).json({ message: "Le mot de passe est requis." });
    }

    const hashedPassword = await argon2.hash(password, hashingOptions);

    req.body.hashed_password = hashedPassword;
    req.body.password = undefined;

    next();
  } catch (error) {
    next(error);
  }
};

const register: RequestHandler = async (req, res, next) => {
  try {
    const newUser = {
      name: req.body.name,
      email: req.body.email,
      hashed_password: req.body.hashed_password,
    };

    const insertId = await authRepository.create(newUser);
    res.status(201).json({ success: true, insertId });
  } catch (error) {
    next(error);
  }
};

export default { login, hashPassword, register };
