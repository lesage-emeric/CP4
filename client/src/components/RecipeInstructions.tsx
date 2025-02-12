import type { RecipeProps } from "../types/types";
import "./RecipeInstructions.css";

function RecipeInstructions({
  instructions,
}: Pick<RecipeProps, "instructions">) {
  return (
    <>
      <h2>Instructions :</h2>
      <ol className="instruction_ol">
        {instructions.map((step) => (
          <li key={step.step}>{step.instruction}</li>
        ))}
      </ol>
    </>
  );
}

export default RecipeInstructions;
