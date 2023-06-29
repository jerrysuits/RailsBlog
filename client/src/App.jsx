import {BrowserRouter, Routes, Route} from "react-router-dom"
import Home from "./pages/Home"
import Login from "./pages/Login"
import "flowbite"
import Register from "./pages/Register"
import SinglePost from "./pages/SinglePost"
import UpdatePassword from "./pages/UpdatePassword"
import Profile from "./pages/Profile"
import ApprovePost from "./pages/ApprovePost"
import Layout from "./layout/Layout"
import AuthProvider from "./context/AuthContext"

function App() {


  return (
    <BrowserRouter>
    <AuthProvider>
    <Routes>
      <Route path="/" element={<Layout/>}>
         <Route index element={<Home />} />
         <Route path="/login" element={<Login />} />
         <Route path="/register" element={<Register />} />
         <Route path="/approve" element={<ApprovePost />} />
         <Route path="/profile" element={<Profile />} />
         <Route path="/post/:id" element={<SinglePost />} />
         <Route path="/updatepassword" element={<UpdatePassword />} />
      </Route>

    </Routes>
    </AuthProvider>
    </BrowserRouter>
    
  )
}

export default App
