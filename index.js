const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
app.use(express.json());

// POST /dealerships
app.post("/dealerships", async (req, res) => {
  try {
    const newUser = await prisma.user.create({
      data: {
        entityType: "DEALERSHIP",
      },
    });

    // Now that we have created the user, let's create the dealership
    const newDealership = await prisma.dealership.create({
      data: {
        name: "ABC Motors",
        // Add other properties of Dealership here
        user: {
          connect: { id: newUser.id }, // Connect the dealership to the newly created user
        },
      },
    });

    const newUser2 = await prisma.user.update({
      where: {
        entityType: "DEALERSHIP",
        id: newUser.id,
      },
      data: {
        entityId: newDealership.id,
      },
    });

    res.json(newUser2);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Could not create dealership." });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
