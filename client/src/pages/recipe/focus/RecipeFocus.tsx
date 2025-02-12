import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import type { RecipeProps } from "../../../types/types";
import "./RecipeFocus.css";
import RecipeIngredients from "../../../components/RecipeIngredients";
import RecipeInstructions from "../../../components/RecipeInstructions";

function RecipeFocus() {
  const { id } = useParams();
  const [recipe, setRecipe] = useState<RecipeProps | null>(null);

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/recipe/${id}`)
      .then((response) => response.json())
      .then((data: RecipeProps) => setRecipe(data));
  }, [id]);

  return (
    <>
      <h2 className="recipe_focus_title">{recipe?.title}</h2>
      <img
        className="recipe_focus_img"
        src={recipe?.image_src}
        alt={recipe?.title}
      />
      <p>
        Prévoyez {recipe?.prep_time} minutes de préparation et{" "}
        {recipe?.cook_time} minutes de cuisson
      </p>
      {recipe && <RecipeIngredients />}
      {recipe && <RecipeInstructions instructions={recipe.instructions} />}
    </>
  );
}

export default RecipeFocus;
