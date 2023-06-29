import React, { useContext } from 'react'
import { AuthContext } from '../context/AuthContext'

export default function ApprovePost() 
{
  const {current_user} = useContext(AuthContext)

  return (
    <div>
    {
    current_user && current_user.is_admin?
    <div>
          Approve Posts
    </div>:
    <p className='text-red-900 text-center'>Only admins can use this page</p>
    }

    </div>
  )
}
