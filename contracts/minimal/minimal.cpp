#include <eosio/eosio.hpp>

CONTRACT minimal : public eosio::contract {
  public:
    using contract::contract;

    ACTION test() {
      eosio::print("works");
    }
};
