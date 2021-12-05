import styles from './app.module.scss';

import { ReactComponent as Logo } from './logo.svg';
import star from './star.svg';
import axios from 'axios';

import { Route, Link } from 'react-router-dom';
import { useEffect, useState } from 'react';

const blogEndpoint = 'http://api.localhost/blog';
// const blogEndpoint = 'http://blog.demo3.example.com/';
const meteoEndpoint = 'http://api.localhost/meteo';
// const meteoEndpoint = 'http://meteo.demo3.example.com/';

export function App() {
  const [blogs, setBlogs] = useState<
    Array<{ id: number; title: string; description: string }>
  >([]);
  const [meteos, setMeteos] = useState<
    Array<{ id: number; city: string; temperature: number }>
  >([]);
  useEffect(() => {
    axios
      .get(blogEndpoint, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        },
      })
      .then(async (response) => {
        const responses = await response.data;
        setBlogs(responses);
      });
    axios
      .get(meteoEndpoint, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        },
      })
      .then(async (response) => {
        const responses = await response.data;
        setMeteos(responses);
      });
  }, []);
  return (
    <div className={styles.app}>
      <header className="flex">
        <Logo width="75" height="75" />
        <h1>Welcome to Knative & Kong Workshop !</h1>
      </header>
      <main>
        <h2>Blog contents</h2>
        <div className="flex github-star-container">
          <div className="container">
            <div className="row">
              {blogs &&
                blogs.length > 0 &&
                blogs.map(({ title, id, description }) => (
                  <>
                    <div className="col-12 border-bottom">
                      <p>
                        {id} - {title}
                      </p>
                      <p>{description}</p>
                      <hr />
                    </div>
                  </>
                ))}
            </div>
          </div>
        </div>
        <h2>Météo contents</h2>
        <div className="flex github-star-container">
          <div className="container">
            <div className="row">
              {meteos &&
                meteos.length > 0 &&
                meteos.map(({ id, temperature, city }) => (
                  <>
                    <div className="col-12 border-bottom">
                      <p>
                        {id} - {city}
                      </p>
                      <p>{temperature} C</p>
                      <hr />
                    </div>
                  </>
                ))}
            </div>
          </div>
        </div>
      </main>
      <br />
      <hr />
      <br />
      <div role="navigation">
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/page-2">Page 2</Link>
          </li>
        </ul>
      </div>
      <Route
        path="/"
        exact
        render={() => (
          <div>
            <Link to="/page-2">Click here for page 2.</Link>
          </div>
        )}
      />
      <Route
        path="/page-2"
        exact
        render={() => (
          <div>
            <Link to="/">Click here to go back to root page.</Link>
          </div>
        )}
      />
      {/* END: routes */}
    </div>
  );
}

export default App;
