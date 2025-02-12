import databaseClient from "../../../database/client";

import type { Rows } from "../../../database/client";

class recipeIngredientRepository {
  async getIngredientsByRecipeId(recipeId: number) {
    const [rows] = await databaseClient.query<Rows>(
      "SELECT ingredient.name, recipe_ingredient.quantity, ingredient.unit FROM recipe_ingredient JOIN ingredient ON recipe_ingredient.ingredient_id = ingredient.id WHERE recipe_ingredient.recipe_id = ?",
      [recipeId],
    );
    return rows;
  }
}

export default new recipeIngredientRepository();
