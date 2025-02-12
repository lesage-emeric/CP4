import databaseClient from "../../../database/client";

import type { Result, Rows } from "../../../database/client";
import type { User } from "../../types/type";

class authRepository {
  async findByEmail(email: string) {
    const [rows] = await databaseClient.query<Rows>(
      "select * from user where email = ?",
      [email],
    );
    return rows[0] as User;
  }

  async create(newUser: Omit<User, "id">) {
    const [result] = await databaseClient.query<Result>(
      "insert into user (name, email, hashed_password) values (?, ?, ?)",
      [newUser.name, newUser.email, newUser.hashed_password],
    );
    return result.insertId;
  }
}

export default new authRepository();
