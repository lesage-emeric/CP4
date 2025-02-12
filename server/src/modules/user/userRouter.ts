import express from "express";
import userActions from "./userActions";

const userRouter = express.Router();

userRouter.get("/api/users", userActions.getAllUsers);

export default userRouter;
