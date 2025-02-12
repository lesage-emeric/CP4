// Import necessary modules from React and React Router
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider, createBrowserRouter } from "react-router-dom";

/* ************************************************************************* */

// Import the main app component
import App from "./App";
import Cart from "./pages/cart/Cart";
import Home from "./pages/home/Home";
import Planning from "./pages/planning/Planning";
import Recipes from "./pages/recipe/Recipes";
import RecipeFocus from "./pages/recipe/focus/RecipeFocus";

// Import additional components for new routes
// Try creating these components in the "pages" folder

// import About from "./pages/About";
// import Contact from "./pages/Contact";

/* ************************************************************************* */

const recipesLoader = async () => {
  try {
    const response = await fetch(`${import.meta.env.VITE_API_URL}/api/recipes`);
    if (!response.ok) {
      throw new Error("Erreur de chargement des recettes");
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Erreur dans le loading des recettes", error);
    throw new Error("Impossible de charger les recettes.");
  }
};

// Create router configuration with routes
// You can add more routes as you build out your app!
const router = createBrowserRouter([
  {
    path: "/", // The root path
    element: <App />, // Renders the App component for the home page
    children: [
      {
        path: "/recettes",
        element: <Recipes />,
        loader: recipesLoader,
      },
      {
        path: "/recette/:id",
        element: <RecipeFocus />,
      },
      {
        path: "/planning",
        element: <Planning />,
      },
      {
        path: "/menu",
        element: <Home />,
      },
      {
        path: "/panier",
        element: <Cart />,
      },
    ],
  },
  // Try adding a new route! For example, "/about" with an About component
]);

/* ************************************************************************* */

// Find the root element in the HTML document
const rootElement = document.getElementById("root");
if (rootElement == null) {
  throw new Error(`Your HTML Document should contain a <div id="root"></div>`);
}

// Render the app inside the root element
createRoot(rootElement).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>,
);

/**
 * Helpful Notes:
 *
 * 1. Adding More Routes:
 *    To add more pages to your app, first create a new component (e.g., About.tsx).
 *    Then, import that component above like this:
 *
 *    import About from "./pages/About";
 *
 *    Add a new route to the router:
 *
 *      {
 *        path: "/about",
 *        element: <About />,  // Renders the About component
 *      }
 *
 * 2. Try Nested Routes:
 *    For more complex applications, you can nest routes. This lets you have sub-pages within a main page.
 *    Documentation: https://reactrouter.com/en/main/start/tutorial#nested-routes
 *
 * 3. Experiment with Dynamic Routes:
 *    You can create routes that take parameters (e.g., /users/:id).
 *    Documentation: https://reactrouter.com/en/main/start/tutorial#url-params-in-loaders
 */
