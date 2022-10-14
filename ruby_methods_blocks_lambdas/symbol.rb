#Symbol review

a {
    hello: "hello a"
}

b {
    hello: "hello b"
}

a[hello] #ruby will use the same symbole of hello, but based on its context,
#in this case the hash of a, it will know which value to point to

