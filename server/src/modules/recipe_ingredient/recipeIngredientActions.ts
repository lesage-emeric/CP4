import type { RequestHandler } from "express";
import recipeIngredientRepository from "./recipeIngredientRepository";

const getIngredientsByRecipeId: RequestHandler = async (req, res, next) => {
  try {
    const recipeId = Number(req.params.id);

    if (Number.isNaN(recipeId)) {
      res.status(400).json({ message: "Invalid recipe ID" });
    }

    const ingredients =
      await recipeIngredientRepository.getIngredientsByRecipeId(recipeId);

    if (!ingredients) {
      res.status(404).json({ message: "Ingredients not found." });
    }
    res.json(ingredients);
  } catch (error) {
    next(error);
  }
};

export default { getIngredientsByRecipeId };
