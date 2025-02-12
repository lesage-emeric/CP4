export type RecipeProps = {
  id: number;
  title: string;
  meal_type: string;
  description: string;
  instructions: { step: number; instruction: string }[];
  image_src: string;
  prep_time: number;
  cook_time: number;
};

export type IngredientProps = {
  name: string;
  quantity: string;
  unit: string;
};
