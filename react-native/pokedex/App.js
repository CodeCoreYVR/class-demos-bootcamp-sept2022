import React, { useState, useEffect } from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, ScrollView } from "react-native";
import Header from "./components/Header";
import PokeList from "./components/PokeList";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import PokemonDetails from "./components/PokemonDetails";

// To create this app:
// $ npm i -g expo-cli
// expo init pokedex
// - choose the blank template
// Note: expo init creates a new react native project, and will also git init the project.
// If the project is within an existing git repo, it should skip git init, but make sure that it does so
// by checking if there is a .git file after you create the project.
// cd pokedex
// expo start

const Stack = createStackNavigator();

const POKEMON_API_ENDPOINT = "https://pokeapi.co/api/v2/";
const FIRST_100_POKEMON_QUERY = "pokemon?limit=100";

export default function App() {
  const [pokeList, setPokeList] = useState([]);

  useEffect(() => {
    fetch(`${POKEMON_API_ENDPOINT}${FIRST_100_POKEMON_QUERY}`)
      .then((res) => res.json())
      .then((payload) => {
        console.log(payload);
        setPokeList(payload.results);
      });
  }, []);

  return (
    <NavigationContainer style={styles.container}>
      <Header />
      <View style={styles.body}>
        <Stack.Navigator
          screenOptions={
            { headerShown: false } // toggle true if you want the default headers
          }
        >
          <Stack.Screen
            name="Pokemon List"
            children={({ navigation }) => {
              return <PokeList list={pokeList} navigation={navigation} />;
            }}
          />
          <Stack.Screen name="Pokemon Details" component={PokemonDetails} />
        </Stack.Navigator>
      </View>
      <StatusBar style="auto" />
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  body: {
    flex: 5,
  },
});
