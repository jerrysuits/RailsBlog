import { createContext, useEffect, useState } from "react";
import  Swal from "sweetalert2"
import { useNavigate } from "react-router-dom";
export const  PostContext = createContext()


export default function PostProvider({children}) 
{
    const nav = useNavigate()
    const [posts, setPosts] = useState([])
    const [onChange, setonChange] = useState(true)

// Delete Post
    const deletePost = (id) =>{
        fetch(`/api/posts/${id}`, {
         method: "DELETE",
                })
        .then((res)=>res.json())
        .then((response)=>{
              if(response.success)
              {
                nav("/")
                Swal.fire(
                    'Success',
                    response.success,
                    'success'
                  )
                  setonChange(!onChange)
              }
              else{
                Swal.fire(
                    'Error',
                    "Something went wrong",
                    'error'
                  )
            }
              

        })
     }
    // fetching posts
    useEffect(()=>{
        fetch("/api/posts")
        .then((res)=>res.json())
        .then((response)=>{
            setPosts(response)
            console.log("Posts ",response)
        })
    }, [onChange])

    const contextData ={
        posts, 
        deletePost
    }

  return (
   <PostContext.Provider value={contextData}>
    {children}
   </PostContext.Provider>
  )
}
