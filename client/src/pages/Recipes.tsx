import { useLoaderData, useNavigate } from "react-router-dom";
import type { RecipeProps } from "../types/types";
import "./Recipes.css";

function Recipes() {
  const recipes = useLoaderData() as RecipeProps[];
  const navigate = useNavigate();
  return (
    <>
      <section className="recipes_list">
        {recipes.map((recipe) => {
          return (
            <article
              className="recipe_container"
              key={recipe.id}
              onClick={() => navigate("/")}
              onKeyUp={(e) => {
                if (e.key === "Enter") navigate("/");
              }}
            >
              <img
                className="recipe_img"
                src={recipe.image_src}
                alt={recipe.title}
              />
              <h2 className="recipe_title">{recipe.title}</h2>
              <p className="recipe_prep">
                Préparation : {recipe.prep_time} minutes
              </p>
              <p className="recipe_cook">
                Cuisson : {recipe.cook_time} minutes
              </p>
            </article>
          );
        })}
      </section>
    </>
  );
}

export default Recipes;
