import { assertEquals } from "$std/assert/assert_equals.ts";
import { assertStringIncludes } from "$std/assert/assert_string_includes.ts";
import { join } from "$std/path/join.ts";
import { respond } from "./server.ts";

async function populateTempDir(
  files: readonly { name: string; content: string }[],
): Promise<string> {
  const encoder = new TextEncoder();
  const tempDirPath = await Deno.makeTempDir();
  for (const { name, content } of files) {
    Deno.writeFile(join(tempDirPath, name), encoder.encode(content));
  }

  return tempDirPath;
}

Deno.test(
  "serveDir should return the correct response for an html file",
  async () => {
    const tempDirPath = await populateTempDir([
      { name: "index.html", content: "" },
      { name: "index.pck", content: "" },
      { name: "index.wasm", content: "" },
    ]);

    const req = new Request("http://localhost");
    const res = await respond(req, tempDirPath);
    await res.body?.cancel();

    assertEquals(res.status, 200);
    assertStringIncludes(res.headers.get("Content-Type") ?? "", "text/html");
  },
);

Deno.test(
  "serveDir should return the correct response for a wasm file",
  async () => {
    const tempDirPath = await populateTempDir([
      { name: "index.wasm", content: "" },
    ]);

    const req = new Request("http://localhost/index.wasm");
    const res = await respond(req, tempDirPath);
    await res.body?.cancel();

    assertEquals(res.status, 200);
    assertStringIncludes(
      res.headers.get("Content-Type") ?? "",
      "application/wasm",
    );
  },
);

Deno.test(
  "serveDir should return the correct response for a pkg file",
  async () => {
    const tempDirPath = await populateTempDir([
      { name: "index.pck", content: "" },
    ]);

    const req = new Request("http://localhost/index.pck");
    const res = await respond(req, tempDirPath);
    await res.body?.cancel();

    assertEquals(res.status, 200);
    assertStringIncludes(
      res.headers.get("Content-Type") ?? "",
      "application/octet-stream",
    );
  },
);
