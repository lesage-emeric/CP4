export type Recipe = {
  id: number;
  title: string;
  description: string;
  instructions: string;
  image_src: string;
  prep_time: number;
  cook_time: number;
};

export type User = {
  id: number;
  name: string;
  email: string;
  hashed_password: string;
};

export type Ingredient = {
  id: number;
};
