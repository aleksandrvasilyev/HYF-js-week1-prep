import fs from "fs/promises";
import connection from "./connection.js";

const main = async () => {
  try {
    const sql = await fs.readFile(`${import.meta.dirname}/db.sql`, "utf-8");
    await connection.query(sql);
  } catch (error) {
    console.error(error);
  } finally {
    await connection.end();
  }
};
main();
