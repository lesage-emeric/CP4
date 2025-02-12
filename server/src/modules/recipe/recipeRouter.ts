import express from "express";
import recipeActions from "./recipeActions";

const recipeRouter = express.Router();

recipeRouter.get("/api/recipes", recipeActions.getAllRecipes);
recipeRouter.get("/api/recipe/:id", recipeActions.getRecipeById);

export default recipeRouter;
