(**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 *)
 
type 'a new_client_type =
  | RequestResponse of 'a ServerCommandTypes.t
  | ConnectPersistent

type ('a, 'b) loop_inputs = {
  disk_changes : (string * string) list;
  new_client : 'a new_client_type option;
  persistent_client_request : 'b ServerCommandTypes.t option;
}

type ('a, 'b) loop_outputs = {
  did_read_disk_changes : bool;
  new_client_response : 'a option;
  persistent_client_response : 'b option;
}
