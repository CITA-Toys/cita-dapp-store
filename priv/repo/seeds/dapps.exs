alias CitaDappStore.Store.Dapp
alias CitaDappStore.Repo

for n <- 1..100 do
  Repo.insert!(%Dapp{
    name: "dapp#{n}",
    desc:
      String.slice(
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        1..200
      ),
    addr: "dapp_addr#{n}",
    abi: "",
    cover: "https://picsum.photos/200/300/?#{n}"
  })
end
