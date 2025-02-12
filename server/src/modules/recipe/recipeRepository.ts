import databaseClient from "../../../database/client";

import type { Rows } from "../../../database/client";
import type { Recipe } from "../../types/type";

class RecipeReposository {
  async readAll() {
    const [rows] = await databaseClient.query<Rows>("select * from recipe");

    return rows as Recipe[];
  }

  async read(id: number) {
    const [rows] = await databaseClient.query<Rows>(
      "select * from recipe where id = ?",
      [id],
    );
    return rows[0] as Recipe;
  }
}

export default new RecipeReposository();
