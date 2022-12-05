import React, { useState, useEffect } from 'react'
import { View, Text, StyleSheet, Image } from 'react-native'

function PokemonDetails(props) {
  const params = props.route.params
  const [pokemon, setPokemon] = useState({})

  useEffect(() => {
    fetch(params.pokemon.url)
    .then(res => res.json())
    .then(data => {
      console.log(data);
      setPokemon(data)
    })
  }, [])
  

  return(
    <View style={styles.container}>
     <Image
      source={{
        uri: pokemon.id? pokemon.sprites.front_default : null
      }} style={styles.image}>
     </Image>
     <Text style={styles.h1}>{pokemon.name}</Text>
     <Text>Height: {pokemon.height}</Text>
     <Text>Weight: {pokemon.weight}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'center'
  },
  h1: {
    fontSize: 30
  },
  image: {
    height: 300,
    width: 300
  }
})

export default PokemonDetails