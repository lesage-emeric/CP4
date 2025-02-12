import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import type { IngredientProps } from "../types/types";

function RecipeIngredients() {
  const { id } = useParams();
  const [ingredients, setIngredients] = useState<IngredientProps[]>([]);

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/recipe/${id}/ingredients`)
      .then((response) => response.json())
      .then((data) => setIngredients(data));
  }, [id]);

  return (
    <>
      <h2>Ingrédients :</h2>
      <ul>
        {ingredients?.map((ingredient) => (
          <li key={ingredient.name}>
            {ingredient.name}: {ingredient.quantity}
            {ingredient.unit}
          </li>
        ))}
      </ul>
    </>
  );
}

export default RecipeIngredients;
