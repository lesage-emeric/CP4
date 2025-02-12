import databaseClient from "../../../database/client";

import type { Result, Rows } from "../../../database/client";
import type { User } from "../../types/type";

class ClassName {
  async readAll() {
    const [rows] = await databaseClient.query<Rows>("select * from user");
    return rows as User[];
  }
}

export default new ClassName();
