import { React } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableHighlight,
} from "react-native";

function PokeList({ list, navigation }) {
  return (
    <ScrollView>
      {list.map((pokemon, i) => {
        return (
          <TouchableHighlight
            key={i}
            underlayColor="lightblue"
            onPress={(event) => {
              navigation.navigate("Pokemon Details", { pokemon });
            }}
          >
            <View style={styles.pokemon}>
              <Text>{pokemon.name}</Text>
            </View>
          </TouchableHighlight>
        );
      })}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  pokemon: {
    borderBottomWidth: 1,
    borderBottomColor: "grey",
    height: 50,
    justifyContent: "center",
    alignItems: "center",
  },
});

export default PokeList;
