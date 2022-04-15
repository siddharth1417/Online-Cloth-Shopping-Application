import { useNavigate } from 'react-router'
import { Link } from "react-router-dom"
import { FaSearch } from "react-icons/fa"
import LoginDropdown from "../navbar/loginDropdown"
import { useEffect } from 'react'
const Navbar = (props) => {
    const navigate = useNavigate()
    return (
        <div>
            <nav class="navbar navbar-expand-lg navbar-light border-bottom navBar">
                <div class="container-fluid">
                    <Link class="navbar-brand" to='/home'>BrandName</Link>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <button className='nav-link noBorder' onClick={() => {
                                    navigate('/products', { state: { catg: 'T-Shirts' } })
                                }}>T-shirts</button>
                            </li>
                            <li class="nav-item">
                                <button className='nav-link noBorder' onClick={() => {
                                    navigate('/products', { state: { catg: 'Shirts' } })
                                }}>Shirts</button>
                            </li>
                            <li class="nav-item">
                                <button className='nav-link noBorder' onClick={() => {
                                    navigate('/products', { state: { catg: 'Bottoms' } })
                                }}>Bottoms</button>
                            </li>
                            <li class="nav-item">
                                <button className='nav-link noBorder' onClick={() => {
                                    navigate('/products', { state: { catg: 'Jackets' } })
                                }}>Jackets</button>
                            </li>
                            <li class="nav-item">

                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>

                        <div>

                            {sessionStorage.tokenId ? <LoginDropdown/> : <Link to='/signin' style={{ marginLeft: 10 + "px" }}>Login</Link>}

                        </div>
                    </div>

                </div>

            </nav>
        </div>
    )
}

export default Navbar