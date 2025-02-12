import express from "express";
import authActions from "./authActions";

const authRouter = express.Router();

authRouter.post("/api/newuser", authActions.hashPassword, authActions.register);
authRouter.post("/api/users", authActions.login);

export default authRouter;
