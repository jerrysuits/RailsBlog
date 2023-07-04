import {BrowserRouter, Routes, Route} from "react-router-dom"
import Home from "./pages/Home"
import Login from "./pages/Login"
import Register from "./pages/Register"
import SinglePost from "./pages/SinglePost"
import UpdatePassword from "./pages/UpdatePassword"
import Profile from "./pages/Profile"
import ApprovePost from "./pages/ApprovePost"
import Layout from "./layout/Layout"
import AuthProvider from "./context/AuthContext"
import PostProvider from "./context/PostContext"


function App() {
  return (
<BrowserRouter>
    <AuthProvider>
      <PostProvider>
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
      </PostProvider>
    </AuthProvider>
    </BrowserRouter>
  );
}

export default App;







