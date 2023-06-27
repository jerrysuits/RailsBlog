import {BrowserRouter, Routes, Route} from "react-router-dom"
import Home from "./pages/Home"
import Login from "./pages/Login"
import "flowbite"

import Layout from "./layout/Layout"

function App() {


  return (
    <BrowserRouter>
    <Routes>
      <Route path="/" element={<Layout/>}>
         <Route index element={<Home />} />
         <Route path="login" element={<Login />} />
      </Route>

    </Routes>
    
    </BrowserRouter>
    
  )
}

export default App
