import fs from "fs/promises";
import connection from "./connection.js";

const main = async () => {
  try {
    await connection.query(`USE recipes;`);

    const getAllVegetarianRecipesWithSalt = await connection.query(`
      SELECT 
      r.name
      FROM recipes r
      JOIN recipes_categories rc 
        ON r.id = rc.recipe_id
      JOIN categories c 
        ON rc.category_id = c.id
      JOIN recipes_ingredients ri 
        ON ri.recipe_id = r.id
      JOIN ingredients i 
        ON i.id = ri.ingredient_id
      WHERE c.name = 'Vegetarian' AND i.name = 'Salt';
  `);
    console.log(getAllVegetarianRecipesWithSalt[0]);

    const getAllNoBakingCakesRecipes = await connection.query(`
      SELECT r.name 
      FROM recipes r
      JOIN recipes_categories rc
      ON r.id = rc.recipe_id
      JOIN categories c
      ON c.id = rc.category_id
      WHERE c.name in ('Cake', 'No-Bake')
      GROUP BY r.name
      HAVING COUNT(DISTINCT c.name) = 2;`);
    console.log(getAllNoBakingCakesRecipes[0]);

    const getAllVeganOrJapaneseRecipes = await connection.query(`
       SELECT r.name 
      FROM recipes r
      JOIN recipes_categories rc
      ON r.id = rc.recipe_id
      JOIN categories c
      ON c.id = rc.category_id
      WHERE c.name = 'Vegan'
      OR c.name = 'Japanese';`);
    console.log(getAllVeganOrJapaneseRecipes[0]);
  } catch (error) {
    console.error(error);
  } finally {
    await connection.end();
  }
};

main();
