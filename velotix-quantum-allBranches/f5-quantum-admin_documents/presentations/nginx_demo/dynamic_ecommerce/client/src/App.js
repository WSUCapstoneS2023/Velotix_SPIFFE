import React, { useEffect, useState } from 'react';
import logo from './logo.svg';
import './App.css';
import TShirt from './components/T-Shirts';
import Header from './components/Navigation/header';
import AlsoBought from './components/Customer';
import Footer from './components/Navigation/footer';
import axios from 'axios';

function App() {
  const [data, setData] = useState({});
  const loadData = async () => {
    const d = await axios.get('/api/values/all');
    setData(d);
  };

  useEffect(() => {
    loadData();
    return () => {};
  }, []);
  return (
    <div className='App'>
      <Header />
      <TShirt />
      <AlsoBought data={data} />
      <Footer />
    </div>
  );
}

export default App;
