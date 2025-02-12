import type { RequestHandler } from "express";
import userRepository from "./userRepository";

const getAllUsers: RequestHandler = async (req, res, next) => {
  try {
    const users = await userRepository.readAll();
    res.json(users);
  } catch (error) {
    next(error);
  }
};

export default { getAllUsers };
