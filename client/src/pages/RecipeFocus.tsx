//

import { useEffect } from "react";

function RecipeFocus() {
  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/recipe/id`);
  }, []);
  return <div>RecipeFocus</div>;
}

export default RecipeFocus;
