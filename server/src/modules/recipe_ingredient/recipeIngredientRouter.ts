import express from "express";
import recipeIngredientActions from "./recipeIngredientActions";

const recipeIngredientRouter = express.Router();

recipeIngredientRouter.get(
  "/api/recipe/:id/ingredients",
  recipeIngredientActions.getIngredientsByRecipeId,
);

export default recipeIngredientRouter;
