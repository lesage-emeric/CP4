import type { RequestHandler } from "express";

import recipeRepository from "./recipeRepository";

const getAllRecipes: RequestHandler = async (req, res, next) => {
  try {
    const recipes = await recipeRepository.readAll();
    res.json(recipes);
  } catch (error) {
    next(error);
  }
};

const getRecipeById: RequestHandler = async (req, res, next) => {
  try {
    const recipeId = Number(req.params.id);
    const recipe = await recipeRepository.read(recipeId);

    if (!recipe) {
      res.status(404).json({ success: false, message: "Recipe not found" });
    }
    res.json(recipe);
  } catch (error) {
    next(error);
  }
};

export default { getAllRecipes, getRecipeById };
