import "./App.css";
import { Outlet, useNavigate } from "react-router-dom";

function App() {
  const navigate = useNavigate();

  return (
    <>
      <nav className="navbar">
        <ul className="nav_ul">
          <li>
            <button type="button" onClick={() => navigate("/recettes")}>
              Recettes
            </button>
          </li>
          <li>
            <button type="button" onClick={() => navigate("/planning")}>
              Planning
            </button>
          </li>
          <li>
            <button type="button" onClick={() => navigate("/menu")}>
              Menu
            </button>
          </li>
          <li>
            <button type="button" onClick={() => navigate("/panier")}>
              Panier
            </button>
          </li>
        </ul>
      </nav>

      <main>
        <Outlet />
      </main>
    </>
  );
}

export default App;
