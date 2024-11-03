import { MongoClient } from "mongodb";

const url = "mongodb://localhost:27017";
const dbName = "recipes";

const client = new MongoClient(url);

async function main() {
  try {
    await client.connect();
    console.log("Successfully connected to the server");

    const db = client.db(dbName);

    const collection = db.collection("recipes");

    const insertResult1 = await collection.insertOne({
      name: "No-Bake Cheesecake",
      categories: ["Cake", "No-Bake", "Vegetarian"],
      ingredients: [
        "Condensed milk",
        "Cream Cheese",
        "Lemon Juice",
        "Pie Crust",
        "Cherry Jam",
      ],
      steps: [
        "Beat Cream Cheese",
        "Add condensed Milk and blend",
        "Add Lemon Juice and blend",
        "Add the mix to the pie crust",
        "Spread the Cherry Jam",
        "Place in refrigerator for 3h.",
      ],
    });

    console.log("Inserted successfully", insertResult1.insertedId);

    const insertResult2 = await collection.insertOne({
      name: "Roasted Brussels Sprouts",
      categories: ["Vegan", "Gluten-Free"],
      ingredients: [
        "Brussels Sprouts",
        "Lemon juice",
        "Sesame seeds",
        "Pepper",
        "Salt",
        "Olive oil",
      ],
      steps: [
        "Preheat the oven",
        "Mix the ingredients in a bowl",
        "Spread the mix on baking sheet",
        "Bake for 30'",
      ],
    });

    console.log("Inserted successfully", insertResult2.insertedId);
  } catch (error) {
    console.log("Error connecting:", error);
  } finally {
    await client.close();
  }
}

main();
