import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import Header from './components/Header'

// To create this app: 
// $ npm i -g expo-cli
// expo init pokedex
// - choose the blank template
// Note: expo init creates a new react native project, and will also git init the project.
// If the project is within an existing git repo, it should skip git init, but make sure that it does so
// by checking if there is a .git file after you create the project.
// cd pokedex
// expo start

export default function App() {
  return (
    <View style={styles.container}>
      <Header />
      <View style={styles.body}>
        <Text>Hello World</Text>
      </View>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  body: {
    flex: 5
  },
});
