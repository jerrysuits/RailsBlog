import React, { useContext } from 'react'
import { AuthContext } from '../context/AuthContext'

export default function Profile() 
{
  const {current_user} = useContext(AuthContext)

  return (
    <div>
    {
      current_user && current_user.username?
      <div>
            Profile
      </div>:
      <p className='text-red-900 text-center'>Not authorized to view this page</p>
      }
    </div>
  )
}
